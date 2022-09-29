#!/usr/bin/python3
""" Creates and distributes an archive to web servers,
using created function deploy and pack"""
from fabric.api import *
import os
do_pack = __import__('1-pack_web_static').do_pack
do_deploy = __import__('2-do_deploy_web_static').do_deploy

env.hosts = ['3.235.198.120', '3.239.50.204']


def deploy():
    """Pack and deploy all file """
    file_path = do_pack()
    if not file_path:
        return False

    run_cmd = do_deploy(file_path)
    return run_cmd
