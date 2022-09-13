def is_floatstring(value):
    try:
        float(value)
        return True
    
    except ValueError:
        try:
            str(value)
            return False
        except Exception:
            return 1