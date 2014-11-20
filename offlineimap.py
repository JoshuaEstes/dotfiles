"""
This file uses GnuGPG to encrypt and decrypt passwords
"""

import hashlib
import logging
import os
import subprocess

# Path to store various keys
password_storage_path = '~/.pw'

def fetch_password(account, server, algo='ripemd160'):
    h = hashlib.new(algo)
    h.update(bytearray(account + server, 'utf-8'))
    filename = os.path.expanduser(password_storage_path) + '/' + h.hexdigest() + '.gpg'
    command = 'gpg --use-agent --quiet --batch -d ' + filename
    output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).strip()

    return output.decode('utf-8')
