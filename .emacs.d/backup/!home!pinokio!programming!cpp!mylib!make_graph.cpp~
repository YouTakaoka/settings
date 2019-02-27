#include<cstdio>
#include<bits/stdc++.h>
typedef long long int ll;
#define REP(i, n) for(int i = 0; i < (n); i++)
#define FOR_IN(i, a, b) for(int i = (a); i < (b); i++)
#define BETWEEN(x, a, b) ((x) >= (a) && (x) <= (b))
#define BIT(b, i) (((b) >> (i)) & 1)
#define LOG_F 1
#define LOG(...) if(LOG_F) fprintf(stderr, __VA_ARGS__)

using namespace std;

ll pow(int x, int n){
  return n == 0 ? 1 : x * pow(x, n - 1);
}

bool next_conbination(int n, int m, int* arr){
  if(m==0) return false;

  arr[m-1]++;  
  while(arr[m-1] < n){
    bool same = false;
    REP(j,m-1){
      if(arr[j] == arr[m-1]){
        same = true;
      }
    }
    
    if(!same){
      return true;
    }
    arr[m-1]++;
  }

  if(!next_conbination(n, m-1, arr)) return false;
  arr[m-1] = 0;
  return next_conbination(n, m, arr);
}

typedef pair<int,int> P;

int main(){
  int n=4;
  int m=3;
  int arr[m];
  REP(i,n){
    arr[i] = i;
  }

  vector<P> es;
  REP(i,n){
    REP(j,n){
      if(i==j) continue;
      es.push_back(P(i,j));
    }
  }


  do{
    cout << n << " " << m<<endl;
    for(auto i : arr){
      cout << es[i].first << " " << es[i].second <<endl;
    }
    cout<<endl;
    
  }while(next_conbination(n*(n-1), m, arr));

  return 0;
}
