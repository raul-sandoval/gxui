﻿using System;
using System.Collections.Generic;
using System.Text;
using Artech.Common.Properties;
using Artech.Genexus.Common.Resolvers;

namespace Artech.UC.gxui.PropertiesResolvers.Panel
{
	public class ModalResolver : ResolverBase, IVisibleResolver
	{
		public bool IsVisible(IPropertyBag properties)
		{
			if (base.CompareFromContext(properties, "UserMode", "1") != 0)          // Runtime
				return true;
			else                                                                    // DesignTime            
			{
				bool showAsWindow = properties.GetPropertyValue<bool>("ShowAsWindow");
				return showAsWindow;
			}
		}

		public string[] GetDependencies()
		{
			string[] dependencies = { "ShowAsWindow" };
			return dependencies;
		}
	}
}
