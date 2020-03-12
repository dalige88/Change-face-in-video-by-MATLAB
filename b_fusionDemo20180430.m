clc;
clear;
%������ʼ�ͽ���֡��
begain = 1;         %�ǵ����ã���
n_frames = 500;     %�ǵ����ã���

% ��ȡͼƬ1
x1 = imread('1.jpg');
%����ʶ����������bboxes1:[x,y,width,height]
faceDetector = vision.CascadeObjectDetector;
bboxes1 = step(faceDetector, x1);
if isempty(bboxes1) == 1
    fprintf('����ͼƬ������Ҫ��');
end
bimg1=x1(bboxes1(2):(bboxes1(2)+bboxes1(4)),bboxes1(1):(bboxes1(1)+bboxes1(3)),:);
% ��������ʶ����
IFaces1 = insertObjectAnnotation(x1, 'rectangle', bboxes1, 'Face');
%figure, imshow(bimg1), title('Detected faces');
fprintf('����ͼƬδʶ�����ֶ�����');
for i=begain:n_frames
    image_name=strcat('my picture\',num2str(i),'.jpg');
    image_name2=strcat('������֡ͼ\',num2str(i),'.jpg');
    x2 = imread(image_name);
    faceDetector = vision.CascadeObjectDetector;
    bboxes2 = step(faceDetector, x2);
    if isempty(bboxes2) == 1
        fprintf(num2str(i));
        fprintf(';');
        continue;
    end
    if size(bboxes2,1) >= 2
       continue;
    end
    bimg2=x2(bboxes2(2):(bboxes2(2)+bboxes2(4)),bboxes2(1):(bboxes2(1)+bboxes2(3)),:);
    IFaces2 = insertObjectAnnotation(x2, 'rectangle', bboxes2, 'Face');
    %figure, imshow(IFaces2), title('Detected faces');

    %ͼƬ����
    bimg1=imresize(bimg1,[size(bimg2,1),size(bimg2,2)]);
    %ͼƬ�ں�
    %out = wtfusion(bimg2,bimg1,2,'db1');  %��ͼ�����ں�
    out = bimg1;    %ֱ�Ӹ���ԭͼ
    %�Ż�ԭͼ
    x3=x2;
    x3(bboxes2(2):(bboxes2(2)+bboxes2(4)),bboxes2(1):(bboxes2(1)+bboxes2(3)),:)=out;
    imwrite(x3, image_name2);
end