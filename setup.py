#python setup.py build_ext --inplace
from distutils.core import setup
from Cython.Build import cythonize
module_list = ['jarvis_respond.pyx', 'jarvis_brain.pyx']
setup(
    ext_modules = cythonize(module_list)
)