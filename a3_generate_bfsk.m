% Alex Ching
% CSE 562 S21 A3

% Implementing transmitter from this paper for A3.
% https://cs.dartmouth.edu/~xia/papers/mobisys15-hilight.pdf

clear all;
close all;
clc;

% Create static images of color blue with varying alpha
image = zeros(360, 480, 3);
image(:,:, 3) = 1;

alpha = 0.1;
image_black = zeros(360, 480, 3);
image_alpha = zeros(360, 480, 3);
image_alpha(:,:,3) = 1 - alpha;

% Create video at 60Hz
video = VideoWriter('output.avi');
video.FrameRate = 60;

open(video);

for i = 1:120
   writeVideo(video, image_black);
end

% Write Data 1100101011 on repeat
% 10 seconds
for i = 1:10
    writeOne(video, image, image_alpha);
    writeOne(video, image, image_alpha);
    writeZero(video, image, image_alpha);
    writeZero(video, image, image_alpha);
    writeOne(video, image, image_alpha);
    writeZero(video, image, image_alpha);
    writeOne(video, image, image_alpha);
    writeZero(video, image, image_alpha);
    writeOne(video, image, image_alpha);
    writeOne(video, image, image_alpha);
end

for i = 1:120
   writeVideo(video, image_black);
end

close(video);

% Writing at 30Hz
function writeOne = writeOne(video, image, image_alpha)
    writeVideo(video, image);
    writeVideo(video, image_alpha);
    writeVideo(video, image);
    writeVideo(video, image_alpha);
    writeVideo(video, image);
    writeVideo(video, image_alpha);
end

% Writing at 20Hz
function writeZero = writeZero(video, image, image_alpha)
    writeVideo(video, image);
    writeVideo(video, image);
    writeVideo(video, image_alpha);
    writeVideo(video, image);
    writeVideo(video, image);
    writeVideo(video, image_alpha);
end