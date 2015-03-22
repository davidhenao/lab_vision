function [segs] = henao_segment_clustering (rgb_image, feature_space, clustering_method, number_clusters)

 if strcmp (feature_space,'rgb')&& strcmp (clustering_method,'kmeans')
     
     image_name = rgb_image;
     n_clusters = number_clusters;
     segs= kmeans_RGB (image_name,n_clusters);
 
 else if strcmp (feature_space,'rgb+xy')&& strcmp (clustering_method,'kmeans')
     
         image_name = rgb_image;
         n_clusters = number_clusters;
         segs= kmeans_RGBxy (image_name,n_clusters);
     
     else if strcmp (feature_space,'lab')&& strcmp (clustering_method,'kmeans')
     
             image_name = rgb_image;
             n_clusters = number_clusters;
             segs= kmeans_LAB (image_name,n_clusters);
             
         else if strcmp (feature_space,'lab+xy')&& strcmp (clustering_method,'kmeans')
     
                 image_name = rgb_image;
                 n_clusters = number_clusters;
                 segs= kmeans_LABxy (image_name,n_clusters);
             
             else if strcmp (feature_space,'hsv')&& strcmp (clustering_method,'kmeans')
                     
                     image_name = rgb_image;
                     n_clusters = number_clusters;
                     segs= kmeans_HSV (image_name,n_clusters);
                      
                 else if strcmp (feature_space,'hsv+xy')&& strcmp (clustering_method,'kmeans')
                         
                         image_name = rgb_image;
                         n_clusters = number_clusters;
                         segs= kmeans_HSVxy (image_name,n_clusters);
                         
                     else if strcmp (feature_space,'rgb')&& strcmp (clustering_method,'gmm')
                             
                             image_name = rgb_image;
                             n_clusters = number_clusters;
                             segs= GMM_RGB (image_name,n_clusters);
                         
                         else if strcmp (feature_space,'rgb+xy')&& strcmp (clustering_method,'gmm')
     
                                 image_name = rgb_image;
                                 n_clusters = number_clusters;
                                 segs= GMM_RGBxy (image_name,n_clusters);
                             
                             else if strcmp (feature_space,'lab')&& strcmp (clustering_method,'gmm')
     
                                     image_name = rgb_image;
                                     n_clusters = number_clusters;
                                     segs= GMM_LAB (image_name,n_clusters);
                                 
                                 else if strcmp (feature_space,'lab+xy')&& strcmp (clustering_method,'gmm')
                                         
                                         image_name = rgb_image;
                                         n_clusters = number_clusters;
                                         segs= GMM_LABxy (image_name,n_clusters);
                                     
                                     else if strcmp (feature_space,'hsv')&& strcmp (clustering_method,'gmm')
                     
                                             image_name = rgb_image;
                                             n_clusters = number_clusters;
                                             segs= GMM_HSV (image_name,n_clusters);
                                         
                                         else if strcmp (feature_space,'hsv+xy')&& strcmp (clustering_method,'gmm')
                         
                                                 image_name = rgb_image;
                                                 n_clusters = number_clusters;
                                                 segs= GMM_HSVxy (image_name,n_clusters);
                                             
                                             else if strcmp (feature_space,'rgb')&& strcmp (clustering_method,'watersheds')
                                                     
                                                     image_name = rgb_image;
                                                     n_clusters = number_clusters;
                                                     segs= watersheds_RGB (image_name,n_clusters);
                                                     
                                                  else if strcmp (feature_space,'lab')&& strcmp (clustering_method,'watersheds')
                                                     
                                                          image_name = rgb_image;
                                                          n_clusters = number_clusters;
                                                          segs= watersheds_LAB (image_name,n_clusters);
                                                     
                                                       else if strcmp (feature_space,'hsv')&& strcmp (clustering_method,'watersheds')
                                                     
                                                               image_name = rgb_image;
                                                               n_clusters = number_clusters;
                                                               segs= watersheds_HSV (image_name,n_clusters);
                                                               
                                                           else
                                                               
                                                               display ('Please introduce a valid name : color space/ method combination')
                                                           end
                                                      end
                                                 end
                                             end
                                         end
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
         end
     end
 end
               
end