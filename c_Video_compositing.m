%%֡ͼƬ�ϲ�����Ƶ
clear;
 %������ʼ�ͽ���֡��
begain = 1;      %�ǵ����ã���
n_frames = 500;    %�ǵ����ã���

temp1='������֡ͼ\';% ·����1
temp2='.jpg';% ·����2
WriterObj=VideoWriter('my video.avi');% xxx.avi��ʾ���ϳɵ���Ƶ����������avi��ʽ�����ļ�·��
open(WriterObj);
for i=begain:n_frames % n_frames��ʾͼ��֡������
im = strcat(temp1,num2str(i),temp2);
if exist(im,'file')==0
   continue;
end
frame=imread(im);% ��ȡͼ�񣬷��ڱ���frame��
writeVideo(WriterObj,frame);% ��frame�ŵ�����WriterObj��
end
close(WriterObj);