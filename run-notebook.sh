#!/bin/bash

mkvirtualenv blackhat
pip install -r requirements.txt
cd /app/data
jupyter notebook --no-browser --port 8888 --ip=* --allow-root
