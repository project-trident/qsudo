# Created by: Kris Moore <kris@ixsystems.com>
# $FreeBSD$

PORTNAME=	qsudo
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	sysutils

MAINTAINER=	kris@ixsystems.com
COMMENT=	Qt sudo front-end

LICENSE=	BSD2CLAUSE

MAKE_ARGS=      PREFIX=${STAGEDIR}${PREFIX}

MAKE_JOBS_UNSAFE=yes
ONLY_FOR_ARCHS= amd64
USE_LDCONFIG=   yes
USE_QT5=        core gui network svg linguist \
		buildtools x11extras
USES=           qmake shebangfix tar:xz
USE_GL+=	gl

WRKSRC_SUBDIR=  src-qt5

QMAKE_ARGS=     CONFIG+="configure"

USE_GITHUB=	yes
GH_ACCOUNT=	trueos
GH_PROJECT=	qsudo
GH_TAGNAME=	%%GHTAG%%

.include <bsd.port.mk>
