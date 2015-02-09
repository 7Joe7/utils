#!/bin/bash

ping -c1 -W1 128.0.0.2 || echo "Server is down"
nmap -p 80 www.ysoft.com || echo "No response"
lsof -i :1616 || echo "port is free"