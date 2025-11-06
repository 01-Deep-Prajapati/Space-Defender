#include "Bullet.h"
#include <Controller.h>

Bullet::Bullet(Controller* controller,QObject* parent): m_x(1536/2 - 50), m_y(764 - 50), ySpeed(-10){
    connect(&bTime, &QTimer::timeout, this, &Bullet::updateBullet);
    bTime.start(16);

    connect(this, &Bullet::bulletDestroyed, controller, &Controller::deleteBullet);
}

void Bullet::updateBullet()
{
    setY(m_y + ySpeed);
    if(m_y < 0){
        emit bulletDestroyed(this);
    }
}
