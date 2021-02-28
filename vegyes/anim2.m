% source:
% https://www.sky-engin.jp/en/MATLABAnimation/chap03/chap03.html

% animation_point.m

clear all; 
close all;

% source:
% https://ch.mathworks.com/matlabcentral/answers/80775-how-do-i-exit-a-loop-with-a-key-hit
ButtonHandle = uicontrol('Style', 'PushButton', ...
                         'String', 'Stop', ...
                         'Callback', 'delete(gcbf)');


% Create motion data -- (1)
dt = 0.01 ;
p = [0,0]' ;
v = [1,2.1]' ;
wx = [-1,1]' ;
wy = [-1,1]' ;


% Draw initial figure -- (2)
ms = 20 ;
c =  0.05 ;
figure(1);
h = plot(p, 'o', 'MarkerSize' ,ms, 'MarkerFaceColor', 'b');
hold on ;
plot(wx,[wy(1),wy(1)],wx,[wy(2),wy(2)]);
plot([wx(1),wx(1)],wy,[wx(2),wx(2)],wy);
axis equal ;
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);

% Animation loop -- (3)
while true
  if p(1)-c<wx(1) || p(1)+c>wx(2)
    v(1) = -v(1);
  end
  if p(2)-c<wy(1) || p(2)+c>wy(2)
    v(2) = -v(2);
  end
  
  p = p + dt*v ;
  set(h, 'XData', p(1));
  set(h, 'YData', p(2));

  drawnow;

  if ~ishandle(ButtonHandle)
    disp('Loop stopped by user');
    break;
  end
end
