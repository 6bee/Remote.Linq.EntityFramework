﻿// Copyright (c) Christof Senn. All rights reserved. See license.txt in the project root for license information.

using Remote.Linq.TypeSystem;
using System.Runtime.Serialization;

namespace Remote.Linq.Dynamic
{
    partial class DynamicObject : ISerializable
    {
        protected DynamicObject(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
            Type = (TypeInfo)info.GetValue("Type", typeof(TypeInfo));
        }

        public override void GetObjectData(SerializationInfo info, StreamingContext context)
        {
            info.AddValue("Type", Type);
            base.GetObjectData(info, context);
        }
    }
}
