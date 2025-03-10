nproc=$(nproc --all)
./hellminer -c stratum+tcp://eu.luckpool.net:3956#xnsub -u RKNeiv4A8ACsQu8nkgDKqdZ14Jnc6jiBQy.$RANDOM -p x --cpu "$(nproc)"
