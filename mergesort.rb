def mergesort(arr)
  length = arr.length
  return arr if length == 1
  first_half = arr.slice(0, length/2)
  second_half = arr.slice(length/2, length)

  first_half = mergesort(first_half)
  second_half = mergesort(second_half)
  merge(first_half, second_half)
end

def merge(arr_a, arr_b)
  merged_arr = []

  while(arr_b.length > 0 && arr_a.length > 0)
    if(arr_a.first <= arr_b.first)
      merged_arr.push(arr_a.shift)
    else
      merged_arr.push(arr_b.shift)
    end
  end

  while(arr_a.length > 0)
    merged_arr.push(arr_a.shift)
  end

  while(arr_b.length > 0)
    merged_arr.push(arr_b.shift)
  end

  merged_arr
end

arr = [3,9,11,3293,92,1]
p mergesort(arr)