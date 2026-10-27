"""Example module."""


def hello(name: str) -> str:
    """Return a greeting for ``name``.

    Args:
        name (str): Name to greet.

    Returns:
        str: greeting message

    Examples:
        .. code:: python

            >>> hello("World")
            'Hello World!'
    """
    return f"Hello {name}!"
