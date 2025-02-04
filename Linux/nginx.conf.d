server {
        listen 443 ssl;
        server_name test.axb.services;

        ssl_certificate /etc/test.axb.services/cert.pem;
        ssl_certificate_key /etc/test.axb.services/key.pem;
        #ssl_session_cache              shared:ssl:1m;
        #ssl_prefer_server_ciphers      on;
        #ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
        #include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

        location /Platformer {
                proxy_pass https://127.0.0.1:3009;
                proxy_http_version  1.1;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header Connection "";

        }

        location /auth/google {
                proxy_pass https://127.0.0.1:3009;
        }

        location /store/ {
                proxy_pass https://127.0.0.1:3019/;
                proxy_http_version  1.1;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header Connection "";

                # try_files $uri $uri/ /Ecomm/index.html;
        }

          location /Store/ {
                proxy_pass https://127.0.0.1:3019/;
                proxy_http_version  1.1;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header Connection "";

                # try_files $uri $uri/ /Ecomm/index.html;
        }


         location / {
                proxy_pass http://127.0.0.1:3008;
                #proxy_http_version 1.1;
                #proxy_set_header Host $host;
                #proxy_set_header Connection "";
                #proxy_set_header X-Real-IP $remote_addr;
                #proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                #proxy_set_header X-Forwarded-Proto $scheme;
        }

}
~      