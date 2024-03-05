% 1.Experiment with these smoothing filters with the images in Figure 1.
% Load the image
image1 = imread('Lenna.png');
image2 = imread('Traffic.jpg');
image3 = imread('Human.jpg');
image4 = imread('Building.jpg');

% Convert the image to double precision for calculations
Lenna    =   im2double(image1);
Traffic  =   im2double(image2);
Human    =   im2double(image3);
Building =   im2double(image4);
%% 1. Smoothed filters
% Define the filters
box_filter = ones(3) / 9; % (a) 3x3 Box filter
weighted_box_filter = [1 2 1; 2 4 2; 1 2 1] / 16; % (b) Weighted 3x3 Box filter
five_by_five_box_filter = ones(5) / 25; % (c) 5x5 Box filter

% Apply the box filter using imfilter for Lenna and Traffic images
Lenna_smoothed_image_a = imfilter(Lenna, box_filter, 'conv');
Lenna_smoothed_image_b = imfilter(Lenna, weighted_box_filter, 'conv');
Lenna_smoothed_image_c = imfilter(Lenna, five_by_five_box_filter, 'conv');

Traffic_smoothed_image_a = imfilter(Traffic, box_filter, 'conv');
Traffic_smoothed_image_b = imfilter(Traffic, weighted_box_filter, 'conv');
Traffic_smoothed_image_c = imfilter(Traffic, five_by_five_box_filter, 'conv');

% Display the original and smoothed images
figure;
subplot(2,2,1); imshow(Lenna); title('Original Image');
subplot(2,2,2); imshow(Lenna_smoothed_image_a); title('Box Filter');
subplot(2,2,3); imshow(Lenna_smoothed_image_b); title('Weighted Box Filter');
subplot(2,2,4); imshow(Lenna_smoothed_image_c); title('5x5 Box Filter');
figure;
subplot(2,2,1); imshow(Traffic); title('Original Image');
subplot(2,2,2); imshow(Traffic_smoothed_image_a); title('Box Filter');
subplot(2,2,3); imshow(Traffic_smoothed_image_b); title('Weighted Box Filter');
subplot(2,2,4); imshow(Traffic_smoothed_image_c); title('5x5 Box Filter');
%///////////////////////////////////////////////
%2.Experiment with these Enhance filters in (a) and (b) and Edge filters in (c)-(f) with the images in Figure 2. 
% Define the Laplacian and Edge filters
laplacian4x4 = [0 1 0; 1 -4 1; 0 1 0]; % (a) 4x4 Laplacian filter
laplacian8x8 = [1 1 1; 1 -8 1; 1 1 1]; % (b) 8x8 Laplacian filter
prewittX = [-1 0 1; -1 0 1; -1 0 1]; % (c) Prewitt X filter
prewittY = [1 1 1; 0 0 0; -1 -1 -1]; % (d) Prewitt Y filter
sobelX = [-1 0 1; -2 0 2; -1 0 1]; % (e) Sobel X filter
sobelY = [1 2 1; 0 0 0; -1 -2 -1]; % (f) Sobel Y filter

% Apply the filters using imfilter for Human and Building Images
Human_enhanced_image_a = imfilter(Human, laplacian4x4, 'conv');
Human_enhanced_image_b = imfilter(Human, laplacian8x8, 'conv');
Human_edge_image_c = imfilter(Human, prewittX, 'conv');
Human_edge_image_d = imfilter(Human, prewittY, 'conv');
Human_edge_image_e = imfilter(Human, sobelX, 'conv');
Human_edge_image_f = imfilter(Human, sobelY, 'conv');

Building_enhanced_image_a = imfilter(Building, laplacian4x4, 'conv');
Building_enhanced_image_b = imfilter(Building, laplacian8x8, 'conv');
Building_edge_image_c = imfilter(Building, prewittX, 'conv');
Building_edge_image_d = imfilter(Building, prewittY, 'conv');
Building_edge_image_e = imfilter(Building, sobelX, 'conv');
Building_edge_image_f = imfilter(Building, sobelY, 'conv');
% Display the original and enhanced images
figure;
subplot(3,3,1); imshow(Human); title('Original Image');
subplot(3,3,2); imshow(Human_enhanced_image_a); title('4x4 Laplacian');
subplot(3,3,3); imshow(Human_enhanced_image_b); title('8x8 Laplacian');
subplot(3,3,4); imshow(Human_edge_image_c); title('Prewitt X');
subplot(3,3,5); imshow(Human_edge_image_d); title('Prewitt Y');
subplot(3,3,6); imshow(Human_edge_image_e); title('Sobel X');
subplot(3,3,7); imshow(Human_edge_image_f); title('Sobel Y');
figure;
subplot(3,3,1); imshow(Building); title('Original Image');
subplot(3,3,2); imshow(Building_enhanced_image_a); title('4x4 Laplacian');
subplot(3,3,3); imshow(Building_enhanced_image_b); title('8x8 Laplacian');
subplot(3,3,4); imshow(Building_edge_image_c); title('Prewitt X');
subplot(3,3,5); imshow(Building_edge_image_d); title('Prewitt Y');
subplot(3,3,6); imshow(Building_edge_image_e); title('Sobel X');
subplot(3,3,7); imshow(Building_edge_image_f); title('Sobel Y');

%////////////////////////////////////////////////////////
%3.  Gaussian Smoothing.  
% Define the Gaussian filters
gaussian3x3_sigma05 = fspecial('gaussian', 3, 0.5);
gaussian3x3_sigma1 = fspecial('gaussian', 3, 1);
gaussian3x3_sigma2 = fspecial('gaussian', 3, 2);

gaussian5x5_sigma05 = fspecial('gaussian', 5, 0.5);
gaussian5x5_sigma1 = fspecial('gaussian', 5, 1);
gaussian5x5_sigma2 = fspecial('gaussian', 5, 2);

gaussian7x7_sigma05 = fspecial('gaussian', 7, 0.5);
gaussian7x7_sigma1 = fspecial('gaussian', 7, 1);
gaussian7x7_sigma2 = fspecial('gaussian', 7, 2);

% Apply the Gaussian smoothed filters using imgaussfilt
Lenna_image_3x3_sigma05 = imgaussfilt(Lenna, 0.5);
Lenna_image_3x3_sigma1 = imgaussfilt(Lenna, 1);
Lenna_image_3x3_sigma2 = imgaussfilt(Lenna, 2);

Lenna_image_5x5_sigma05 = imgaussfilt(Lenna, 0.5, 'FilterSize', 5);
Lenna_image_5x5_sigma1 = imgaussfilt(Lenna, 1, 'FilterSize', 5);
Lenna_image_5x5_sigma2 = imgaussfilt(Lenna, 2, 'FilterSize', 5);

Lenna_image_7x7_sigma05 = imgaussfilt(Lenna, 0.5, 'FilterSize', 7);
Lenna_image_7x7_sigma1 = imgaussfilt(Lenna, 1, 'FilterSize', 7);
Lenna_image_7x7_sigma2 = imgaussfilt(Lenna, 2, 'FilterSize', 7);

Traffic_image_3x3_sigma05 = imgaussfilt(Traffic, 0.5);
Traffic_image_3x3_sigma1 = imgaussfilt(Traffic, 1);
Traffic_image_3x3_sigma2 = imgaussfilt(Traffic, 2);

Traffic_image_5x5_sigma05 = imgaussfilt(Traffic, 0.5, 'FilterSize', 5);
Traffic_image_5x5_sigma1 = imgaussfilt(Traffic, 1, 'FilterSize', 5);
Traffic_image_5x5_sigma2 = imgaussfilt(Traffic, 2, 'FilterSize', 5);

Traffic_image_7x7_sigma05 = imgaussfilt(Traffic, 0.5, 'FilterSize', 7);
Traffic_image_7x7_sigma1 = imgaussfilt(Traffic, 1, 'FilterSize', 7);
Traffic_image_7x7_sigma2 = imgaussfilt(Traffic, 2, 'FilterSize', 7);

% Display the original and smoothed images
figure;
subplot(2, 2, 1); imshow(Lenna); title('Original Image');
subplot(2, 2, 2); imshow(Lenna_image_3x3_sigma05); title('Gaussian 3x3, σ=0.5');
subplot(2, 2, 3); imshow(Lenna_image_3x3_sigma1); title('Gaussian 3x3, σ=1');
subplot(2, 2, 4); imshow(Lenna_image_3x3_sigma2); title('Gaussian 3x3, σ=2');
figure;
subplot(2, 2, 1); imshow(Lenna); title('Original Image');
subplot(2, 2, 2); imshow(Lenna_image_5x5_sigma05); title('Gaussian 5x5, σ=0.5');
subplot(2, 2, 3); imshow(Lenna_image_5x5_sigma1); title('Gaussian 5x5, σ=1');
subplot(2, 2, 4); imshow(Lenna_image_5x5_sigma2); title('Gaussian 5x5, σ=2');
figure;
subplot(2, 2, 1); imshow(Lenna); title('Original Image');
subplot(2, 2, 2); imshow(Lenna_image_7x7_sigma05); title('Gaussian 7x7, σ=0.5');
subplot(2, 2, 3); imshow(Lenna_image_7x7_sigma1); title('Gaussian 7x7, σ=1');
subplot(2, 2, 4); imshow(Lenna_image_7x7_sigma2); title('Gaussian 7x7, σ=2');

figure;
subplot(2, 2, 1); imshow(Traffic); title('Original Image');
subplot(2, 2, 2); imshow(Traffic_image_3x3_sigma05); title('Gaussian 3x3, σ=0.5');
subplot(2, 2, 3); imshow(Traffic_image_3x3_sigma1); title('Gaussian 3x3, σ=1');
subplot(2, 2, 4); imshow(Traffic_image_3x3_sigma2); title('Gaussian 3x3, σ=2');
figure;
subplot(2, 2, 1); imshow(Traffic); title('Original Image');
subplot(2, 2, 2); imshow(Traffic_image_5x5_sigma05); title('Gaussian 5x5, σ=0.5');
subplot(2, 2, 3); imshow(Traffic_image_5x5_sigma1); title('Gaussian 5x5, σ=1');
subplot(2, 2, 4); imshow(Traffic_image_5x5_sigma2); title('Gaussian 5x5, σ=2');
figure;
subplot(2, 2, 1); imshow(Traffic); title('Original Image');
subplot(2, 2, 2); imshow(Traffic_image_7x7_sigma05); title('Gaussian 7x7, σ=0.5');
subplot(2, 2, 3); imshow(Traffic_image_7x7_sigma1); title('Gaussian 7x7, σ=1');
subplot(2, 2, 4); imshow(Traffic_image_7x7_sigma2); title('Gaussian 7x7, σ=2');
