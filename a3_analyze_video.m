% Alex Ching
% CSE 562 S21 A3

% Implementing analyzer from this paper for A3.
% https://cs.dartmouth.edu/~xia/papers/mobisys15-hilight.pdf

clear all;
close all;
clc;

load('data.mat');

i = 0;
sample_freq = 60;
sample_period = 1/sample_freq;
sample_length = 6;
sample_time_vector = (0:sample_length-1)*sample_period;

bit = zeros(9,100);

shift = [2, 3, 4, 2, 2, 6, 5 ,1];

frame_window = zeros(6,1);
for i = 1:8
    frame = data{i};
    frame = frame(shift(i):end);
    
% for m = 1:7
%     frame = frame(m:end);

    k = 0;
    for j = 0:floor(length(frame)/6) - 1
        k = k+1;
        frame_window = frame(j*6+1:j*6+6);

        Y = fft(frame_window);
        P2 = abs(Y/sample_length);
        P1 = P2(1:sample_length/2+1);
        P1(2:end-1) = 2*P1(2:end-1);

        f = sample_freq*(0:(sample_length/2))/sample_length;

        [maxOut, index] = max(P1(3:4));
        window_freq = f(index+2);

        if window_freq == 30
%             test(m,k) = 1;
            bit(i,k) = 1;
        elseif window_freq == 20
%             test(m,k) = 0;
            bit(i,k) = 0;
        else
%             test(m,k) = -1;
            bit(i,k) = -1;
        end
%     end
    end
    
end

pcolor(bit);
colormap(gray(2))
