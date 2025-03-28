# Dağıtık Hesaplama Sistemi: MPI ve OpenMP ile Paralel İşleme

Bu proje, Docker konteynerlerini kullanarak çoklu düğümlü bir dağıtık hesaplama sistemi oluşturur. Sistem, MPI (Message Passing Interface) ve OpenMP teknolojilerini kullanarak hem düğümler arası hem de düğüm içi paralel işleme yapabilme yeteneğine sahiptir.

## Sistem Mimarisi

- **Docker Konteynerler**: Bir master ve iki worker node içeren dağıtık sistem
- **MPI**: Düğümler arası iletişim ve veri paylaşımı
- **OpenMP**: Her düğüm içinde çok çekirdekli paralel işleme
- **Ubuntu 20.04**: Temel işletim sistemi

## Kurulum

1. Gereksinimleri yükleyin:
   - Docker
   - Docker Compose

2. Projeyi klonlayın:
```bash
git clone [proje-url]
cd [proje-dizini]
```

3. Sistemi başlatın:
```bash
docker-compose build
docker-compose up -d
```

## Kullanım

1. Master node'a bağlanın:
```bash
docker exec -it mpi_master bash
```

2. Test programını derleyin:
```bash
cd /app
mpicc -fopenmp mpi_omp_test.c -o mpi_omp_test
```

3. Programı çalıştırın:
```bash
mpirun --allow-run-as-root -np 3 ./mpi_omp_test
```

## Teknik Detaylar

- **MPI**: Düğümler arası veri paylaşımı ve senkronizasyon
- **OpenMP**: Düğüm içi paralel işleme ve thread yönetimi
- **Docker Network**: Konteynerler arası iletişim için özel ağ
- **Shared Volume**: Kod ve veri paylaşımı için ortak dizin

## Lisans

MIT License 