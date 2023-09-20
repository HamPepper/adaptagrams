/*
 * vim: ts=4 sw=4 et tw=0 wm=0
 *
 * libavoid - Fast, Incremental, Object-avoiding Line Router
 *
 * Copyright (C) 2012  Monash University
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * See the file LICENSE.LGPL distributed with the library.
 *
 * Licensees holding a valid commercial license may use this file in
 * accordance with the commercial license agreement provided with the
 * library.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * Author(s):   Michael Wybrow
*/

#ifndef AVOID_DLLEXPORT_H
#define AVOID_DLLEXPORT_H

#if !defined(_MSC_VER)
#  define AVOID_STATIC_DEFINE
#endif

#ifdef AVOID_STATIC_DEFINE
#  define AVOID_EXPORT
#  define AVOID_NO_EXPORT
#else
#  ifndef AVOID_EXPORT
#    ifdef avoid_EXPORTS
        /* We are building this library */
#      define AVOID_EXPORT __declspec(dllexport)
#    else
        /* We are using this library */
#      define AVOID_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef AVOID_NO_EXPORT
#    define AVOID_NO_EXPORT
#  endif
#endif

#ifndef AVOID_DEPRECATED
#  define AVOID_DEPRECATED __declspec(deprecated)
#endif

#ifndef AVOID_DEPRECATED_EXPORT
#  define AVOID_DEPRECATED_EXPORT AVOID_EXPORT AVOID_DEPRECATED
#endif

#ifndef AVOID_DEPRECATED_NO_EXPORT
#  define AVOID_DEPRECATED_NO_EXPORT AVOID_NO_EXPORT AVOID_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef AVOID_NO_DEPRECATED
#    define AVOID_NO_DEPRECATED
#  endif
#endif

#endif
