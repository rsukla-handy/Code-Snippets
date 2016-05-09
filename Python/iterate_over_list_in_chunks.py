from itertools import izip_longest
from string import ascii_letters
def grouper(iterable, n, fillvalue=None):
    args = [iter(iterable)] * n
    return izip_longest(*args, fillvalue=fillvalue)
print list(grouper(ascii_letters, 3))

'''
>>> l = range(1,11)
>>> i = iter(l)
>>> zip(i, i)
[(1, 2), (3, 4), (5, 6), (7, 8), (9, 10)]
>>> zip(i, i, i)
[]
>>> zip(i, i)
[]
>>> l = range(1,11)
>>> i = iter(l)
>>> zip(i, i, i)
 [(1, 2, 3), (4, 5, 6), (7, 8, 9)]
>>>
'''

