# Removing duplicate elements in arr
# By keeping the order of the elements in arr
# For O(n*lgn) time
def remove_duplicates(arr):
  found = set()
  result = []

  for x in arr:
    if x not in found:
      result.append(x)
      found.add(x)
  
  return result


if __name__ == "__main__":
  test = [1,2,2,2,3,3,4,5,5]
  print(remove_duplicates(test))
