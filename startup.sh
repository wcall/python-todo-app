#!/bin/bash

# Install AppDynamics
pip install -U appdynamics\<4.5

# Start app
pyagent run -c /appdynamics.cfg python /app/app.py
