import Foundation

class Solution {
    public int kthSmallest(matrix: [Int], k: Int) {
        Heap heap = new Heap(k + 1);
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                heap.insert(matrix[i][j]);
            }
        }
        return heap.peek();
    }

    class Heap {
        var N = 0;
        var arr = [Int]();

        init() {
            arr = []
        }

        func insert(val: Int) {
            if (N < arr.count - 1) {
                N += 1
                arr[N] = val
                swim(N)
            } else {
                if (val < arr[1]) {
                    arr[1] = val
                    sink(idx: 1)
                }
            }
        }

        private func sink(idx: Int) {
            while (idx * 2 <= N) {
                var j = idx * 2
                if (j < N && min(j, j + 1)) {
                    j += 1
                }

                if (!min(idx, j)) {
                    break;
                }
                exch(idx, j);
                idx = j;
            }
        }

        private void swim(int idx) {
            while (idx > 1 && less(idx / 2, idx)) {
                exch(idx / 2, idx);
                idx = idx / 2;
            }
        }

        private void exch(int a, int b) {
            int tmp = arr[a];
            arr[a] = arr[b];
            arr[b] = tmp;
        }

        private boolean less(int a, int b) {
            return arr[a] < arr[b];
        }

        public int peek() {
            return arr[1];
        }
    }
}
