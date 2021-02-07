if minerd --help
    then
    echo "minerd detected."
    else
    echo "minerd not detected. Build/Installing..."
    ./autogen.sh
    ./configure C{,XX}FLAGS="-O3"
    make
    sudo make install
fi
case $1 in
    BitZeny) if minerd -a yescrypt -o stratum+tcp://leywapool.com:6243 -u $2
                 then
                 exit
                 else
                 echo "Err: This minerd do not support yescrypt. Uninstall minerd and try again. We will install it for you."
             fi ;;
    ZNY) $0 BitZeny $2 ;;
    bitzeny) $0 ZNY $2 ;;
    BitCoin) if minerd -a sha256d -o stratum+tcp://sha256.eu.nicehash.com:3334 -O $2:x
                 then
                 exit
                 else
                 echo "Err: This minerd do not support SHA-256. Uninstall minerd and try again. We will install it for you."
             fi ;;
    BTC) $0 BitCoin $2 ;;
    bitcoin) $0 BTC $2
esac
