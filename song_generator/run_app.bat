@echo off
echo Installing dependencies...
pip install -r requirements.txt
echo.
echo Starting Song Generator...
streamlit run app.py
pause
