"""
Uses GnuGPG to encrypt and decrypt information for use with offlineimap.
"""

import hashlib
import logging
import os
import subprocess

"""
Storage path is the location where this information is stored. This is a private
git repository in my case, however it can be just a directory
"""
storage_path = '~/.pw'

def get_username(account, user_id):
    """
    account is the account name, can be anything
    user_id is the gpg user id to use to encrypt/decrypt the file contents
    """
    filename = os.path.expanduser(storage_path) + '/' + account.lower() + '.username.gpg'
    command  = 'gpg --local-user ' + user_id + ' --no-verbose --output - --use-agent --quiet --batch --decrypt ' + filename
    # output   = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).strip()
    output   = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).split("\n")

    return output[0].decode('utf-8')


def get_password(account, user_id):
    """
    account is the account name, can be anything
    user_id is the gpg user id to use to encrypt/decrypt the file contents
    """
    filename = os.path.expanduser(storage_path) + '/' + account.lower() + '.password.gpg'
    command  = 'gpg --local-user ' + user_id + ' --no-verbose --output - --use-agent --quiet --batch --decrypt ' + filename
    output   = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True).strip()

    return output.decode('utf-8')
