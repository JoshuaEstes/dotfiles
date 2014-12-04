"""
This file uses GnuGPG to encrypt and decrypt passwords
"""

import hashlib
import logging
import os
import subprocess

# Path to store various keys
password_storage_path = '~/.pw'

def fetch_password(account, server, algo='ripemd160', local_user=None):
    """
    Takes a hash of the account and server and uses that as the filename
    for which the password is contained within. The file must already be
    encrypted using GPG
    """
    h = hashlib.new(algo)
    h.update(bytearray(account + server, 'utf-8'))
    filename = os.path.expanduser(password_storage_path) + '/' + h.hexdigest() + '.gpg'
    if local_user is not None:
        command = 'gpg --local-user ' + local_user + ' --no-verbose --output - --use-agent --quiet --batch --decrypt ' + filename
    else:
        command = 'gpg --no-verbose --output - --use-agent --quiet --batch --decrypt ' + filename

    output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).strip()
    #print(output.decode('utf-8'))

    return output.decode('utf-8')

def retrieve_password(filename, user_id):
    """
    filename is the filename located in `password_storage_path` minus `.gpg` and user_id
    is the GPG user id to use for decryption
    """
    filename = os.path.expanduser(password_storage_path) + '/' + filename + '.gpg'
    command  = 'gpg --local-user ' + user_id + ' --no-verbose --output - --use-agent --quiet --batch --decrypt ' + filename
    output   = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).strip()

    return output.decode('utf-8')
