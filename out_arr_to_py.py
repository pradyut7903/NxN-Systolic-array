s= input("Enter out_arr :")
d= int(input("Enter input data size :"))
N= int(input("Enter size of matrix :"))
m = 2*d + N - 1
for i in range(N*N):
    num =  s[m*i:m*(i+1)] . replace ("Z","")
    print(int(num,2))
