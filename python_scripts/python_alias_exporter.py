#!/usr/bin/python3
import inspect
import types
import os

#
# def extract_public_functions_from_module(module):
#     # returns a list of the names of the public functions defined in :module
#     mems = inspect.getmembers(module)
#     # The folowing 2 operation are technically useless, but it is a good explanation of what I actually want to do
#     members_to_ignore = [
#         "__builtins__",
#         "__cached__",
#         "__doc__",
#         "__file__",
#         "__loader__",
#         "__name__",
#         "__package__",
#         "__spec__",
#     ]
#     local_members = (m for m in mems if m[0] not in members_to_ignore)
#     functions = (f for f in local_members if isinstance(f[1], types.FunctionType))
#     return [f[0] for f in functions if not f[0].startswith("_")]
#

# vvvvvvvvv   build the aliases   vvvvvvvvv

from odoo_alias import CALLABLE_FROM_SHELL

aliases = [
    f"{fname}() {{ $AP/python_scripts/odoo_alias.py {fname} $@ }}\n"
    for fname in CALLABLE_FROM_SHELL
]

from typo import typo_alias_list

aliases += typo_alias_list

# path to the automatically generated scripts
auto_script_path = f"{os.getenv('AP')}/autogenerated_scripts.sh"
with open(auto_script_path, "w") as f:
    for a in aliases:
        f.write(a)
