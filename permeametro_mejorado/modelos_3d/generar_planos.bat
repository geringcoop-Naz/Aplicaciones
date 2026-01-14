@echo off
REM ============================================
REM Script para generar planos 2D (DXF) automáticamente
REM Requiere: OpenSCAD instalado y en el PATH
REM ============================================

echo ================================================
echo GENERACION DE PLANOS 2D - Permeametro Mejorado
echo ================================================
echo.

REM Verificar si OpenSCAD está instalado
where openscad >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: OpenSCAD no encontrado en el PATH
    echo.
    echo Por favor instale OpenSCAD desde: https://openscad.org/
    echo O agregue OpenSCAD al PATH del sistema
    echo.
    echo Ubicacion tipica: C:\Program Files\OpenSCAD\openscad.exe
    pause
    exit /b 1
)

echo OpenSCAD encontrado. Generando planos...
echo.

REM Crear directorio para salida
if not exist "planos_2d" mkdir planos_2d

REM ============================================
REM Generar proyecciones 2D
REM ============================================

echo [1/6] Generando vista de planta - Tapa superior...
openscad -o "planos_2d/01_tapa_superior_planta.dxf" "proyeccion_tapa_planta.scad" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo     OK - Archivo generado
) else (
    echo     ERROR - Fallo al generar
)

echo [2/6] Generando seccion transversal - Tapa superior...
openscad -o "planos_2d/01_tapa_superior_seccion.dxf" "proyeccion_tapa_seccion.scad" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo     OK - Archivo generado
) else (
    echo     ERROR - Fallo al generar
)

echo [3/6] Generando plano - Brida inferior...
openscad -o "planos_2d/02_brida_inferior.dxf" -D "projection(cut=false) import(\"02_brida_inferior.scad\");" "02_brida_inferior.scad" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo     OK - Archivo generado
) else (
    echo     ERROR - Fallo al generar
)

echo [4/6] Generando plano - Difusor...
openscad -o "planos_2d/03_difusor_entrada.dxf" -D "projection(cut=false) import(\"03_difusor_entrada.scad\");" "03_difusor_entrada.scad" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo     OK - Archivo generado
) else (
    echo     ERROR - Fallo al generar
)

echo [5/6] Generando plano - Base inferior...
openscad -o "planos_2d/04_base_inferior.dxf" -D "projection(cut=false) import(\"04_base_inferior.scad\");" "04_base_inferior.scad" 2>nul
if %ERRORLEVEL% EQU 0 (
    echo     OK - Archivo generado
) else (
    echo     ERROR - Fallo al generar
)

echo.
echo ============================================
echo Generando modelos 3D (STL)...
echo ============================================
echo.

echo [6/6] Exportando modelos 3D para impresion/mecanizado...
openscad -o "planos_2d/01_tapa_superior.stl" "01_tapa_superior.scad" 2>nul
openscad -o "planos_2d/02_brida_inferior.stl" "02_brida_inferior.scad" 2>nul
openscad -o "planos_2d/03_difusor_entrada.stl" "03_difusor_entrada.scad" 2>nul
openscad -o "planos_2d/04_base_inferior.stl" "04_base_inferior.scad" 2>nul

echo.
echo ============================================
echo Generando PLANOS TECNICOS ACOTADOS (DXF)...
echo ============================================
echo.

openscad -o "planos_2d/PLANO_TAPA_SUPERIOR_ACOTADO.dxf" "plano_tapa_superior_con_cotas.scad" 2>nul
echo     OK - Plano Tapa Acotado
openscad -o "planos_2d/PLANO_BRIDA_INFERIOR_ACOTADO.dxf" "plano_brida_inferior_con_cotas.scad" 2>nul
echo     OK - Plano Brida Acotado
openscad -o "planos_2d/PLANO_DIFUSOR_ACOTADO.dxf" "plano_difusor_con_cotas.scad" 2>nul
echo     OK - Plano Difusor Acotado
openscad -o "planos_2d/PLANO_BASE_ACOTADO.dxf" "plano_base_con_cotas.scad" 2>nul
echo     OK - Plano Base Acotado

echo     OK - Modelos STL generados

echo.
echo ============================================
echo PROCESO COMPLETADO
echo ============================================
echo.
echo Archivos generados en: %CD%\planos_2d\
echo.
echo Archivos DXF (2D):
echo   - 01_tapa_superior_planta.dxf
echo   - 01_tapa_superior_seccion.dxf
echo   - 02_brida_inferior.dxf
echo   - 03_difusor_entrada.dxf
echo   - 04_base_inferior.dxf
echo.
echo Archivos STL (3D):
echo   - 01_tapa_superior.stl
echo   - 02_brida_inferior.stl
echo   - 03_difusor_entrada.stl
echo   - 04_base_inferior.stl
echo.
echo Puede abrir los archivos DXF en:
echo   - LibreCAD (gratuito)
echo   - AutoCAD
echo   - Cualquier software CAD
echo.
echo Abrir carpeta de salida? (S/N)
set /p ABRIR=

if /I "%ABRIR%"=="S" (
    explorer "planos_2d"
)

pause
