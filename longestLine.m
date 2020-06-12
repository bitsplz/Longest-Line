function longestLine( I,lines )
if size(I,3)>1 %dimension check
    I=rgb2gray(I); %convert to garyscale
end
BW = edge(I,'canny');
[H,theta,rho] = hough(BW);
P = houghpeaks(H,lines,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(BW,theta,rho,P,'FillGap',100,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
% highlight the longest line segment
%title('Red is Longest among ');
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
end

