# merge sorting

def mergesort(list):
    if len(list) > 1:
        mid = len(list) // 2
        L = list[:mid]
        R = list[mid:]

        mergesort(L)
        mergesort(R)

        list.clear()
        while len(L) > 0 and len(R) > 0:
            if L[0] <= R[0]:
                list.append(L[0])
                L.pop(0)
            else:
                list.append(R[0])
                R.pop(0)

        for i in L:
            list.append(i)
        for i in R:
            list.append(i)

list = [10, 7, 3, 9, 1, 5]
print("Original list:", list)
mergesort(list)
print("Sorted list by merge sorting:",list)