# $FreeBSD$

PORTNAME=	qsudo
PORTVERSION=	201607011941
CATEGORIES=	sysutils

MAINTAINER=	kris@ixsystems.com
COMMENT=	Qt sudo front-end

LICENSE=	BSD2CLAUSE

RUN_DEPENDS=	${LOCALBASE}/bin/sudo:security/sudo

WRKSRC_SUBDIR=  src-qt5
MAKE_ARGS=      PREFIX=${STAGEDIR}${PREFIX}
MAKE_JOBS_UNSAFE=yes
ONLY_FOR_ARCHS= amd64
USE_LDCONFIG=   yes
USE_QT5=        core gui network svg linguist \
		buildtools x11extras widgets
USES=           qmake shebangfix tar:xz
USE_GL+=	gl

QMAKE_ARGS=     CONFIG+="configure"

USE_GITHUB=	yes
GH_ACCOUNT=	trueos
GH_PROJECT=	qsudo
GH_TAGNAME=	1e70606d45d6ef982d6e41c91c6f3c879a539456

PLIST_FILES=	bin/qsudo

.include <bsd.port.mk>
