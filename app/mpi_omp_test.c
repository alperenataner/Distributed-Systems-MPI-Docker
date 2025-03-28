#include <stdio.h>
#include <mpi.h>
#include <omp.h>

int main(int argc, char *argv[]) {
    int rank, size;
    
    // MPI başlatma
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    
    // OpenMP paralel bölgesi
    #pragma omp parallel
    {
        int thread_id = omp_get_thread_num();
        int num_threads = omp_get_num_threads();
        
        #pragma omp critical
        {
            printf("Merhaba! Ben %d numaralı MPI işlemcisindeki %d numaralı OpenMP thread'iyim.\n", 
                   rank, thread_id);
        }
    }
    
    MPI_Finalize();
    return 0;
}