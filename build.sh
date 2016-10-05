#!/bin/bash

export WORKSPACE=pwd

#Create Virtual Env

virtualenv venv

source venv/bin/activate

pip install -r requirements.txt
