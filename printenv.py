#!/usr/bin/env python3

import os

for param in sorted(os.environ.keys()):
    value = os.environ[param]
    
    if param.startswith( ('AWS_', 'AZURE_') ):
        value = '[REDACTED]'

    print("%s: %s " % (param, value))
