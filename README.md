# NGINX-SEKM



Jednoduchý kontejner, který spouští reverzní proxy NGINX, která zpřístupňuje tyto kontejnerizované služby systému SEKM3. 

1. `/portal` je směrována na kontejner na portu `5000`
2. `/rest` je směrována na kontejner na portu `3011`
3. `/geoserver` je směrována na kontejner na portu `8080`
4. `/kibana` je směrována na kontejner na portu `5601`
5. `/restmock` je směrována na kontejner na portu `3001`
6. `/wireframe` je směrována na kontejner na portu `3000`
7. `/portainer` je směrována na kontejner na portu `8090`


## Jak získat obraz

Je více způsobů, jak získaz obraz do Vašeho systému. Preferovaným způsobem je prosté stažení

```
docker pull sysnetcz/nginx-sekm
```

Pokuc chcete vytvořit obraz sami bez  _apt-cacher_ udělejte toto:

```
docker build -t sysnetcz/nging-sekm git://github.com/SYSNET-CZ/nging-sekm
```

Sestavení obrazu s použitím _apt-cacher_ musíte nejprve naklonovat tento repozitář lokálně, upravit obsah _71-apt-cacher-ng_ tak, aby odpovídal vašemu kešovacímu stroji. Pak setavte obraz pomocí lokálního url místo přímé interakce s githubem. 

```
git clone git://github.com/SYSNET-CZ/nginx-sekm
```

Teď upravte  ``71-apt-cacher-ng`` a potom proveďte:

```
docker build -t sysnetcz/nginx-sekm .
```

## Spuštění


Běžící kontejner vytvoříte takto:

```
sudo docker run --name "nginx-sekm" -p 443:443 -d -t sysnetcz/nginx-sekm
```

## Příslušenství docker-compose.yml

Pro pohodlné nasazení poskytujeme  ``docker-compose.yml``, který usnadní nasazení kontejneru. 

Příklad:

```
docker-compose up -d
```

## Uložení dat mimo kontejner

Lze použít Docker volumes pro uložení Vašich dat.



```
mkdir -p ~/nginx_data
docker run -d -v $HOME/nginx_data:/usr/share/nginx/html
```

Ujistěte se, že adresář ``nginx_data`` má správné nastavení přístupových práv, aby je mohl proces Docker číst..


## Credits

Radim Jaeger (rjaeger@sysnet.cz)



