# enuygun-case
GKE Cluster Kurulumu
kubernetes.tf ile GKE üzerinde cluster oluşturdum. Varsayılan logging ve monitoring servisleri devre dışı bırakıldı. Default node pool kaldırılarak özelleştirilmiş node pool'lar için alan açıldı.

İki Node Pool Oluşturulması

main-pool: Sabit node sayısı ile sistem bileşenleri için kullanıldı.

application-pool: Otomatik ölçekleme aktif (min: 1, max: 3).
Her iki pool da n2d-standard-4 tipinde ve europe-west1 bölgesinde konumlandırıldı.
![image](https://github.com/user-attachments/assets/6164a89e-50ee-403b-9d68-17e626333953)


Sample Uygulama Deploy Edilmesi
Uygulama sadece application-pool'da çalışacak şekilde nodeSelector ve toleration ile konfigüre edildi.



HPA ile Otomatik Pod Ölçekleme
CPU %25’i aştığında pod sayısını 1–3 arasında ayarlayan HorizontalPodAutoscaler tanımlandı. Test için yük simülasyonu yapıldı.
![image](https://github.com/user-attachments/assets/02871763-7838-4daf-8829-470c5ee801bb)

Prometheus & Grafana Monitoring
kube-prometheus-stack Helm chart ile kurulum yapıldı. Prometheus metrikleri toplarken, Grafana bu verileri görselleştiriyor.

Grafana Alarm Sistemi
Pod restart sayısına göre alarm tanımlandı. 5 dakikada eşiğin aşılması durumunda uyarı üretiyor.
![image](https://github.com/user-attachments/assets/cfe45263-7afa-4f9a-9f6f-b290c5a5b9a9)


KEDA ile Gelişmiş Ölçekleme
keda.tf ile CPU bazlı node autoscaling (min 1 - max 3) yapılandırıldı. KEDA kullanılarak HPA alternatifi olarak test edildi.
![image](https://github.com/user-attachments/assets/3f4b4b7b-9f32-4ebc-9185-63e139730f00)


Istio Entegrasyonu
Istio bileşenleri (istio-base, istiod, ingress, egress) kuruldu. istio-injection aktif edildi. Gateway ve VirtualService ile dış erişim sağlandı.
![image](https://github.com/user-attachments/assets/2de83d03-19ba-4443-952d-d4e5d5df2329)
![image](https://github.com/user-attachments/assets/17f5d7c1-1d38-43ca-a66d-cdf0736129a0)

![image](https://github.com/user-attachments/assets/bdbeca69-38db-47ee-8a2f-c7c3134fd3cf)

