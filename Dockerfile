FROM nginx:alpine
MAINTAINER Radim Jaeger <rjaeger@sysnet.cz>



COPY nginx.conf /etc/nginx/nginx.conf
COPY dhparam.pem /etc/ssl/certs
COPY nginx-selfsigned.crt /etc/ssl/certs
COPY nginx-selfsigned.key /etc/ssl/certs
COPY sites.conf /etc/nginx/sites
COPY index.html /usr/share/nginx/html/index.html

# Open ports 443 and 80 so linked containers can see them
EXPOSE 443
EXPOSE 80

