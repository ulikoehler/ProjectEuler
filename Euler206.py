
# coding: utf-8

# In[29]:

import math
import itertools
start = int(math.sqrt(1020304050607080900))
end = int(math.sqrt(2000000000000000000))
start, end, end - start


# In[30]:

def isWhatWeAreLookingFor(n):
    s = str(n)
    return s[0::2] == "1234567890"
assert isWhatWeAreLookingFor(1020304050607080900)


# In[31]:

for i in range(start, end):
    if isWhatWeAreLookingFor(i**2):
        print(i)
        break


# In[ ]:



