// KM.cpp : 定义控制台应用程序的入口点。
//

#include <stdlib.h>

#define NODE_NUM 8
#define MAX(x,y) ((x)>(y)?(x):(y))
#define MIN(x,y) ((x)<(y)?(x):(y))
int lx[NODE_NUM];
int ly[NODE_NUM];

int match[NODE_NUM];

int usex[NODE_NUM];
int usey[NODE_NUM];

int w[NODE_NUM][NODE_NUM];

int dfs(int left_num) {
	int right_num = 0;
	usex[left_num] = 1;
	for (; right_num < NODE_NUM; right_num++) {
		if (!usey[right_num] && (lx[left_num]) + ly[right_num] == w[left_num][right_num]) {
			usey[right_num] = 1;
			if (match[right_num] == -1 || dfs(match[right_num])) {
			
				match[right_num] = left_num;
				return 1;
			}
		
		}
	}

	return 0;
}


int KM() {
	int left_num, right_num,i,j;
	int d = 1000000;
	memset(ly, 0, sizeof(ly));
	memset(lx, -1, sizeof(lx));
	memset(match, -1, sizeof(match));

	for (left_num = 0; left_num < NODE_NUM; left_num++)
		for (right_num = 0; right_num < NODE_NUM; right_num++)
			lx[left_num] = MAX(lx[left_num], w[left_num][right_num]);

	for (left_num = 0; left_num < NODE_NUM; left_num++) {
		while (1) {
			memset(usex, 0, sizeof(usex)); 
			memset(usey, 0, sizeof(usey));
			if (dfs(left_num))break;
			for (i = 0; i < NODE_NUM; i++) {
				if (usex[i])
					for (j = 0; j < NODE_NUM; j++)
						if (!usey[j])
							d = MIN(d, lx[i] + ly[j] - w[i][j]);
			}
			for (i = 0; i < NODE_NUM; i++) {
				if (usex[i]) lx[i] -= d;
				if (usey[i]) ly[i] += d;
			}
		}
	}
	return 1;
}






int main()
{
	int i = 0, j = 0;
	int loop = 100000;
	while(loop--) {
		for (i = 0; i < NODE_NUM; i++) {
			for (j = 0; j < NODE_NUM; j++) {
				w[i][j] = rand() % 100 + 1;
//				cout << w[i][j] <<"\t" ;
			}
//			cout << endl;
		}
//		KM();
//		for (i = 0; i < NODE_NUM; i++) {
//			cout << match[i] << " " << i;
//			cout << endl;
//		}
	}
//	system("pause");
    return 0;
}

