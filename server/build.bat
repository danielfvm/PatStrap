@echo off


REM Create virtual environment and install requirements
python -m venv patstrap-server-env
source patstrap-server-env\bin\activate 
pip install -r requirements.txt

REM Use pyinstaller to create a standalone WINDOWS executable at .\dist\patstrap-server\patstrap-server.exe
pyinstaller gui.py -n patstrap-server --noconsole --noconfirm --onefile --add-data "global.css;." --path=.\patstrap-server-env\lib\python3.11\site-packages --hidden-import zeroconf._utils.ipaddress --hidden-import zeroconf._handlers.answers
pyinstaller gui.py -n patstrap-server-debug --noconfirm --onefile --add-data "global.css;." --path=.\patstrap-server-env\lib\python3.11\site-packages --hidden-import zeroconf._utils.ipaddress --hidden-import zeroconf._handlers.answers
