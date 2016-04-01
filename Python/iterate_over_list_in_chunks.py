
from itertools import izip_longest
from string import ascii_letters
def grouper(iterable, n, fillvalue=None):
    args = [iter(iterable)] * n
    return izip_longest(*args, fillvalue=fillvalue)

print list(grouper(ascii_letters, 3))

