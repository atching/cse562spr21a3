clear all;
close all;
clc;

video = VideoReader('0120.mp4');
i = 0;

frames0120 = zeros(1, 1000);
frames0140 = zeros(1, 1000);
frames0180 = zeros(1, 1000);
frames01120 = zeros(1, 1000);
frames0520 = zeros(1, 1000);
frames0540 = zeros(1, 1000);
frames0580 = zeros(1, 1000);
frames05120 = zeros(1, 1000);

while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0120(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('0140.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0140(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('0180.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0180(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('01120.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames01120(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('0520.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0520(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('0540.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0540(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('0580.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames0580(i) = sum(sum(frame(:,:,3)));
end

video = VideoReader('05120.mp4');
i = 0;
while hasFrame(video)
    i = i+1;
    frame = readFrame(video);
    frames05120(i) = sum(sum(frame(:,:,3)));
end

frames0120 = frames0120(76:667);
data{1} = frames0120;
frames0140 = frames0140(133:724);
data{2} = frames0140;
frames0180 = frames0180(116:704);
data{3} = frames0180;
frames01120 = frames01120(97:683);
data{4} = frames01120;

frames0520 = frames0520(76:667);
data{5} = frames0520;
frames0540 = frames0540(124:718);
data{6} = frames0540;
frames0580 = frames0580(101:689);
data{7} = frames0580;
frames05120 = frames05120(121:712);
data{8} = frames05120;

for i = 1:8
    subplot(2,4,i);
    plot(data{i});
end

save('data.mat')