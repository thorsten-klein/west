#!/usr/bin/env python3

import subprocess

from pathlib import Path
from setuptools.build_meta import build_wheel as actual_build_wheel
from setuptools.build_meta import prepare_metadata_for_build_wheel as actual_prepare_metadata_for_build_wheel

def apply_patches():
    print("Info: Function apply_patches()")
    patch_dir = Path(__file__).parent / "patches"
    for patch in sorted(patch_dir.glob("*.patch")):
        print(f"Applying patch: {patch.name}")
        #subprocess.check_call(["patch", "-p1", "-i", str(patch)])
        subprocess.check_call(["git", "am", str(patch)])

def prepare_metadata_for_build_wheel(*args, **kwargs):
    print("Info: Function prepare_metadata_for_build_wheel()")
    apply_patches()
    return actual_prepare_metadata_for_build_wheel(*args, **kwargs)

def build_wheel(*args, **kwargs):
    print("Info: Function build_wheel()")
    apply_patches()
    return actual_build_wheel(*args, **kwargs)
