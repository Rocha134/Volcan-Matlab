%Proyecto Final

%Equipo 4
%Integrantes:
%Erik García Cruz - A01732440
%Aldo Mauricio Cruz Lozada - A01732372
%Francisco Rocha Juárez - A01730560


%-------------Ruta-------------------------------------------------------
%Capturamos los datos de elevación de la ruta de Google Earth
%Transcribimos estos datos en Excel a partir de
%esto sacamos líneas de tendencia para poder graficar la funcion de la
%ladera en Matlab

opcion=0;
while (opcion~=3)
    fprintf('\n \npor favor, selecciona una opción\n1.Sin resistencia de aire\n2.Resistencia de aire en contra\n  3.Salir\n ');
    opcion = (input('Opción: '));
    switch opcion
    case 1
     %-----SIN RESISTENCIA DEL AIRE----
%Curva del volcan (Ruta 4)
axis([0 5500 3774.7 5301.5])
hold on
I = imread('Volcan3.jpeg');
h = image(xlim,ylim,I);
uistack(h,'bottom')

%----Variables Globales-----
%X --- Distancia horizontal
%Y --- Curva del volcan
%b --- Resistencia del aire
%vi --- Velocidad inicial
%ang --- Angulo inicial
%h --- Altura del volcan
%e --- número de Euler
%viy --- velocidad inicial vertical
%vix ---- Velocidad inicial horizontal
%hl --- altura de la ruta (curva del volcan)

%Graficamos nuestra ruta
X=0:250:5700.1;
%Ecuación de nuestra ruta
Y = 6*10^(-05)*X.^2 - 0.6076*X + 5301.5;
plot(X,Y,'r');
hold on
    fprintf('EL siguiente programa simulará como el volcán Popocatépetl expulsa\npiroclastos con un radio de 0.4 metros y una masa de 90 kilogramos, \ntomando la ladera sur del volcán')
%Variable para la velocidad inicial
vi=((input('\nDetermina la velocidad inicial en km/h: ')))/(3.6);
%Variable para el angulo inicial
ang=(input('\nDetermina el ángulo: '));
%Variable de cantidad de puntos a graficar
puntos=(input('\nIntroduce el número de puntos a graficar: '));
%Variable de a que paso se avanza la iteración en el ciclo
paso=(input('\nIntroduce el paso (exactitud de los puntos): '));

h=5292;
viy=vi*sind(ang);
vix=vi*cosd(ang);
hl=0;
%Ya que tenemos todas las variables necesarias, empezamos a graficar la
%trayectoria del proyectil. Utilizamos un 'for' que graficara la posición
%del volcán cada 0.5 segundos, considerando resistencia al aire

%----Resistencia la aire en contra---
title('Popocatépetl'), axis([0 inf 3600 5600]);
for i=0:paso:puntos
    y1=h+viy*i-.5*9.81*i^2;
    x1=vix*i;
    vx=vix;
    vy=viy-9.81*i;
    vel=sqrt(vx^2+vy^2);
    
    %Antes de graficar cada punto, se utiliará el siguientes 'if' para
    %saber la altura de la ladera en ese punto
    
    if (0.1<=x1) && (x1<5700)
        hl=6*10^(-05)*x1^2 - 0.6076*x1 + 5301.5;
    end

    if y1<=hl
        plot(x1,y1,'or','MarkerSize',10,'MarkerFaceColor','b')
        time = i;
        xfin = x1;
        yfin = y1;
        vfin = vel;
        break
    end
    hold on
    %También se estará mostrando continuamente la posición y la velocidad
    %en cada instante de la trayectoria con lo siguiente:
    str = ['Posición: (',num2str(x1),'m,',num2str(y1),'m)'];
    t= text(2600,5400,str);
    str2 = ['Velocidad: ',num2str(vel*3.6),'km/h'];
    t2= text(2600,4600,str2);
    pause(0.5);
    figure(1),plot(x1,y1,'or');
    delete(t);
    delete(t2);
end

%Esto último mostrará cuadros de texto con los parámetros iniciales y los
%valores finales de la trayectoria
dim2=[.25 .6 .3 .3];
str2= {'Ángulo (grados): ',num2str(ang),'Velocidad inicial(km/h): ',num2str(vi*3.6)};
a2 = annotation('textbox',dim2,'String',str2,'FitBoxToText','on');

dimtiempo=[.67 .8 .5 .1];
strtiempo={'El tiempo fue',num2str(time),'segundos'};
atiempo = annotation('textbox',dimtiempo,'String',strtiempo,'FitBoxToText','on');

dimpos=[.67 .6 .9 .1];
strpos= {'Posición final x (m): ',num2str(xfin),'Posición final y (m): ',num2str(yfin)};
apos = annotation('textbox',dimpos,'String',strpos,'FitBoxToText','on');

dimvel=[.67 .4 .5 .1];
strvel={'Velocidad final(km/h): ',num2str(vfin*3.6)};
avel = annotation('textbox',dimvel,'String',strvel,'FitBoxToText','on');
%--------------FIN GRAFICA SIN RESISTENCIA DE AIRE----------
    
    case 2
        %--------RESISTENCIA EN CONTRA-----
        
%Cargamos la imagen y la ajustamos      
axis([0 5500 3774.7 5301.5])
hold on
I = imread('Volcan3.jpeg');
h = image(xlim,ylim,I);
uistack(h,'bottom')

%Curva del volcan (Ruta 4)
X=0:250:5700.1;
%Ecuación de la ruta
Y = 6*10^(-05)*X.^2 - 0.6076*X + 5301.5;
plot(X,Y,'r');
hold on 

%----Variables Globales-----
%X --- Distancia horizontal
%Y --- Curva del volcan
%b --- Resistencia del aire
%vi --- Velocidad inicial
%ang --- Angulo inicial
%h --- Altura del volcan
%e --- número de Euler
%viy --- velocidad inicial vertical
%vix ---- Velocidad inicial horizontal
%hl --- altura de la ruta (curva del volcan)
        
    fprintf('EL siguiente programa simulará como el volcán Popocatépetl expulsa\npiroclastos con un radio de 0.4 metros y una masa de 90 kilogramos, \ntomando la ladera sur del volcán')
%Variable para la resistencia del aire
b=(input('\n \nDetermina el valor de resistencia al aire(valores entre 0.0000038 y 0.0000047): '));
%Variable para la velocidad inicial
vi=((input('\nDetermina la velocidad inicial en km/h: ')))/(3.6);
%Variable para el angulo inicial
ang=(input('\nDetermina el ángulo: '));
%Variable de cantidad de puntos a graficar
puntos=(input('\nIntroduce el número de puntos a graficar: '));
%Variable de a que paso se avanza la iteración en el ciclo
paso=(input('\nIntroduce el paso (exactitud de los puntos): '));


h=5292;
e=2.71828;
viy=vi*sind(ang);
vix=vi*cosd(ang);
hl=0;
%Ya que tenemos todas las variables necesarias, empezamos a graficar la
%trayectoria del proyectil. Utilizamos un 'for' que graficara la posición
%del volcán cada 0.5 segundos, considerando resistencia al aire

%----Resistencia la aire en contra---
title('Popocatépetl'), axis([0 inf 3600 5600]);
for i=0:paso:puntos
    y2=(((1/b)*((9.8/b)+viy)*(1-e^(-b*i)))-((9.8/b)*i))+h;
    x2=(vix/b)*(1-(e^(-b*i)));
    vx=vix*(e^(-b*i));
    vy=(e^(-b*i))*((9.8/b)+viy)-(9.8/b);
    vel=sqrt(vx^2+vy^2);
    
    %Antes de graficar cada punto, se utiliará el siguientes 'if' para
    %saber la altura de la ladera en ese punto
    
    if (0.1<=x2) && (x2<5700)
        hl=6*10^(-05)*x2^2 - 0.6076*x2 + 5301.5;
    end

    if y2<=hl
        plot(x2,y2,'or','MarkerSize',10,'MarkerFaceColor','b')
        time = i;
        xfin = x2;
        yfin = y2;
        vfin = vel;
        break
    end
    hold on
    %También se estará mostrando continuamente la posición y la velocidad
    %en cada instante de la trayectoria con lo siguiente:
    str = ['Posición: (',num2str(x2),'m,',num2str(y2),'m)'];
    t= text(2600,5400,str);
    str2 = ['Velocidad: ',num2str(vel*3.6),'km/h'];
    t2= text(2600,4600,str2);
    pause(0.5);
    figure(1),plot(x2,y2,'or');
    delete(t);
    delete(t2);
end

%Esto último mostrará cuadros de texto con los parámetros iniciales y los
%valores finales de la trayectoria
dim2=[.25 .6 .3 .3];
str2= {'Ángulo (grados): ',num2str(ang),'Velocidad inicial(km/h): ',num2str(vi*3.6),'Coeficiente de resistencia al aire:',num2str(b)};
a2 = annotation('textbox',dim2,'String',str2,'FitBoxToText','on');

dimtiempo=[.67 .8 .5 .1];
strtiempo={'El tiempo fue',num2str(time),'segundos'};
atiempo = annotation('textbox',dimtiempo,'String',strtiempo,'FitBoxToText','on');

dimpos=[.67 .6 .9 .1];
strpos= {'Posición final x (m): ',num2str(xfin),'Posición final y (m): ',num2str(yfin)};
apos = annotation('textbox',dimpos,'String',strpos,'FitBoxToText','on');

dimvel=[.67 .4 .5 .1];
strvel={'Velocidad final(km/h): ',num2str(vfin*3.6)};
avel = annotation('textbox',dimvel,'String',strvel,'FitBoxToText','on');
%--------------FIN GRAFICA RESISTENCIA DEL AIRE EN CONTRA----------
    
    case 3
    fprintf('\n Gracias por su tiempo\n ');
    opcion=3;
    
    otherwise
    fprintf('Por favor, selecciona nuevamente');
    
    end

end