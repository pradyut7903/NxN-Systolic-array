def transform_matrix_b(matrix):
    N = len(matrix)
    d={}
    l=[]
    for i in range(N):
        for j in range(N):
            l.append([i,j])

    sum_arr = []
    for i in range(2*N-1):
        sum_arr.append(i)
 
    for j in sum_arr:
        
        poss = []
        current = j
        for k in l:
            if sum(k)== current :
                poss.append(k)
        d[current]= poss

    #print(d)

    for i in sum_arr:
        coords = d[i]
        #coords = coords[::-1]
        number_zeros= N - len(coords)
        
        
        if i >= N:
            left = 1
        else:
            left = 0

        if left == 0:
            print ( number_zeros * "00000000",end='')

            
        for k in coords:
            print(format (matrix[k[0]][k[1]],'08b'),end='')

        if left ==0:
            print()

        if left == 1:
            print ( number_zeros * "00000000",end='')
            print()


def transform_matrix_a(matrix):
    N = len(matrix)
    d={}
    l=[]
    for i in range(N):
        for j in range(N):
            l.append([i,j])

    sum_arr = []
    for i in range(2*N-1):
        sum_arr.append(i)
 
    for j in sum_arr:
        
        poss = []
        current = j
        for k in l:
            if sum(k)== current :
                poss.append(k)
        d[current]= poss


    for i in sum_arr:
        coords = d[i]
        coords = coords[::-1]
        number_zeros= N - len(coords)
        
        
        if i >= N:
            left = 1
        else:
            left = 0



        if left == 0:
            print ( number_zeros * "00000000",end='')
 


            
        for k in coords:
            print(format(matrix[k[0]][k[1]],'08b'),end='')



        if left == 1:
            print ( number_zeros * "00000000",end='')
            print()

        if left == 0:
            print()

matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
]

transform_matrix_a(matrix)
print()
transform_matrix_b(matrix)

