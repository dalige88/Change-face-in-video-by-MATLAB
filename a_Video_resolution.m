%%��Ƶ��ֳ�֡ͼƬ
clc;
clear;
%% ��ȡ��Ƶ
video_file='��������Ƶ.mp4';
video=VideoReader(video_file);
frame_number=video.NumberOfFrames;
%% ����ͼƬ
for i=1:frame_number
    image_name=strcat('my picture\',num2str(i));
    image_name=strcat(image_name,'.jpg');
    I=read(video,i);  %����ͼƬ
    
    imwrite(I,image_name,'jpg');                   %дͼƬ
    I=[];
end
