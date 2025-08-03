"""Basic test for FoBiS import and configuration"""
import pytest


def test_import_fobis():
    """Test that we can import the main fobis module"""
    try:
        import fobis
        assert fobis is not None
    except ImportError:
        pytest.fail("Could not import fobis module")


def test_import_config():
    """Test that we can import the FoBiS configuration"""
    try:
        from fobis.FoBiSConfig import __version__, __appname__
        assert __version__ is not None
        assert __appname__ == "FoBiS.py"
    except ImportError:
        pytest.fail("Could not import FoBiS configuration")


def test_main_entry_point():
    """Test that the main entry point is accessible"""
    try:
        from fobis.fobis import main
        assert callable(main)
    except ImportError:
        pytest.fail("Could not import main function")
