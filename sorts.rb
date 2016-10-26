# insertion sort algorithm
def insertion_sort (array)
  for j in (1..array.length)
    key = array[j]
    i = j - 1

    while i.to_i >= 0 && array[i].to_i > key.to_i
      array[i + 1] = array[i]
      i = i - 1
    end

    array[i + 1] = key
  end
  array
end

# merge sort algorithm
def merge_sort(array, p, r)
  if p.to_i < r.to_i
    q = ((p.to_i + r.to_i)/2).floor
    merge_sort(array, p, q)
    merge_sort(array, q+1, r)
    merge(array, p, q, r)
  end
  array
end

def merge(array, p, q, r)
  n1 = q.to_i - p.to_i + 1
  n2 = r.to_i - q.to_i
  left = []
  right = []

  for i in (0..n1)
    left[i] = array[p + i]
  end

  for j in (0..n2)
    right[j] = array[q+j+1]
  end

  left[n1] = (2**(0.size * 8 -2) -1)
  right[n2] = (2**(0.size * 8 -2) -1)

  i = 0
  j = 0

  for k in (p..r)
    if left[i].to_i <= right[j].to_i
      array[k] = left[i]
      i = i + 1
    else
      array[k] = right[j]
      j = j + 1
    end
  end
  array
end

# quick sort
def quicksort(array, p, r)
  if p.to_i < r.to_i
    q = partition(array, p, r)
    quicksort(array, p, q-1)
    quicksort(array, q+1, r)
  end
  array
end

def partition(array, p, r)
  x = array[r-1]
  i = p.to_i - 1

  for j in (p..(r-1))
    if array[j].to_i <= x.to_i
      i = i.to_i + 1
      if i.to_i != j.to_i
        array[i], array[j] = array[j], array[i]
      end
    end
  end

  if (i + 1).to_i != r.to_i
    array[i + 1], array[r - 1] = array[r - 1], array[i + 1]
  end
  i.to_i + 1
end
